# frozen_string_literal: true

require 'spec_helper'

describe 'powerdns::config', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os} with recursor_use_yaml => true" do
      let(:facts) { facts.merge(root_home: '/root') }
      let(:pre_condition) do
        <<-PUPPET
        class { 'powerdns':
          authoritative         => true,
          recursor              => true,
          authoritative_version => '5.0',
          recursor_version      => '5.3',
          recursor_use_yaml     => true,
          db_root_password      => 'rootpass',
          db_username           => 'pdns',
          db_password           => 'secret',
        }
        PUPPET
      end
      let(:title) { 'foo' }

      case facts[:os]['family']
      when 'RedHat'
        authoritative_config = '/etc/pdns/pdns.conf'
        recursor_dir = '/etc/pdns-recursor'
      else
        authoritative_config = '/etc/powerdns/pdns.conf'
        recursor_dir = '/etc/powerdns'
      end
      recursor_config = "#{recursor_dir}/recursor.conf"

      context 'recursor type uses YAML file (with include_dir stanza)' do
        let(:params) { { setting: 'foo', value: 'bar', type: 'recursor' } }

        it { is_expected.to contain_file(recursor_config).with_ensure('file') }

        it 'includes the include_dir stanza in the YAML content' do
          is_expected.to contain_file(recursor_config)
            .with_content(%r{include_dir:\s*"?#{Regexp.escape(recursor_dir)}/recursor\.d"?})
        end
      end

      context 'authoritative still writes to pdns.conf via file_line' do
        let(:params) { { setting: 'foo', value: 'bar' } }

        it do
          is_expected.to contain_file_line("powerdns-config-foo-#{authoritative_config}")
            .with_path(authoritative_config)
        end
      end
    end
  end
end
