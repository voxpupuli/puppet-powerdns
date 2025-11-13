# frozen_string_literal: true

require 'spec_helper'

describe 'powerdns::config', type: :define do
  on_supported_os.each do |os, facts|
    # gate to Debian 12/13 and Ubuntu 22.04/24.04
    debian_family = facts[:os]['family'] == 'Debian'
    debian_ok     = facts[:os]['name'] == 'Debian' && %w[12 13].include?(facts[:os]['release']['major'])
    ubuntu_ok     = facts[:os]['name'] == 'Ubuntu' && facts[:os]['release']['full'] =~ %r{\A(22\.04|24\.04)\z}
    next unless debian_family && (debian_ok || ubuntu_ok)

    context "on #{os} with recursor_use_yaml => true" do
      let(:facts) { facts.merge(root_home: '/root') }
      let(:title) { 'foo' }

      # single memoized helper for all paths
      let(:paths) do
        rec_dir = '/etc/powerdns' # YAML OSes here are all Debian-family
        {
          rec_dir: rec_dir,
          recursor_config: File.join(rec_dir, 'recursor.conf'),
          authoritative_config: File.join(rec_dir, 'pdns.conf'),
        }
      end

      let(:pre_condition) do
        <<-PUPPET
        class { '::powerdns':
          authoritative     => true,
          recursor          => true,
          recursor_use_yaml => true,
          db_root_password  => 'rootpass',
          db_username       => 'pdns',
          db_password       => 'secret',
          recursor_config_includedir  => '#{paths[:rec_dir]}/recursor.d',
          recursor_forward_zones_file => '#{paths[:rec_dir]}/forward_zones.yml',
          recursor_local_config_file  => '#{paths[:rec_dir]}/recursor-local.yml',
        }
        PUPPET
      end

      context 'recursor type uses YAML file (with include_dir stanza)' do
        let(:params) { { setting: 'foo', value: 'bar', type: 'recursor' } }

        it { is_expected.to contain_file(paths[:recursor_config]).with_ensure('file') }

        it 'includes the include_dir stanza in the YAML content' do
          is_expected.to contain_file(paths[:recursor_config]).
            with_content(%r{include_dir:\s*"?#{Regexp.escape(paths[:rec_dir])}/recursor\.d"?})
        end
      end

      context 'authoritative still writes to pdns.conf via file_line' do
        let(:params) { { setting: 'foo', value: 'bar' } }

        it do
          is_expected.to contain_file_line("powerdns-config-foo-#{paths[:authoritative_config]}").
            with_path(paths[:authoritative_config])
        end
      end
    end
  end
end
