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

      let(:config_paths) do
        recursor_dir = case facts[:os]['family']
                       when 'RedHat'
                         '/etc/pdns-recursor'
                       else
                         '/etc/powerdns'
                       end

        authoritative_config = case facts[:os]['family']
                               when 'RedHat'
                                 '/etc/pdns/pdns.conf'
                               else
                                 '/etc/powerdns/pdns.conf'
                               end

        {
          authoritative_config: authoritative_config,
          recursor_dir: recursor_dir,
          recursor_config: "#{recursor_dir}/recursor.conf",
        }
      end

      context 'recursor type uses YAML file (with include_dir stanza)' do
        let(:params) { { setting: 'foo', value: 'bar', type: 'recursor' } }

        it { is_expected.to contain_file(config_paths[:recursor_config]).with_ensure('file') }

        it 'includes the include_dir stanza in the YAML content' do
          is_expected.to contain_file(config_paths[:recursor_config])
            .with_content(%r{include_dir:\s*"?#{Regexp.escape(config_paths[:recursor_dir])}/recursor\.d"?})
        end
      end

      context 'authoritative still writes to pdns.conf via file_line' do
        let(:params) { { setting: 'foo', value: 'bar' } }

        it do
          is_expected.to contain_file_line("powerdns-config-foo-#{config_paths[:authoritative_config]}")
            .with_path(config_paths[:authoritative_config])
        end
      end
    end
  end
end
