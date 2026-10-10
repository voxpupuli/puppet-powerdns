# frozen_string_literal: true

require 'spec_helper'

describe 'powerdns::recursor' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:pre_condition) do
          <<-EOS
            class { 'powerdns':
              db_root_password => 'foobar',
              db_username => 'foo',
              db_password => 'bar',
              recursor_use_yaml => true,
            }
          EOS
        end
        let(:facts) do
          facts
        end

        let(:recursor_dir) do
          case facts[:os]['family']
          when 'RedHat'
            '/etc/pdns-recursor'
          else
            '/etc/powerdns'
          end
        end

        it { is_expected.to compile.with_all_deps }

        context 'custom config' do
          let(:params) do
            {
              include: {
                '00-defaults.yml': {
                  logging: {
                    loglevel: 6,
                  },
                },
              },
            }
          end

          it 'checks file resource based on hiera value' do
            is_expected.to contain_file("#{recursor_dir}/recursor.d/00-defaults.yml").with('ensure' => 'file')
          end
        end

        context 'with forward zones' do
          let(:params) do
            {
              config: {
                recursor: {
                  threads: 2,
                },
              },
              forward_zones_file: 'forward_zones',
              forward_zones: [
                {
                  'zone'       => '.',
                  'forwarders' => ['1.1.1.1'],
                  'recurse'    => true,
                },
              ],
            }
          end

          it 'includes main config in yaml format' do
            is_expected.to contain_file("#{recursor_dir}/recursor.conf").with('ensure' => 'file')
                                                                        .with_content(<<~EOS,
                                                                          ---
                                                                          recursor:
                                                                            include_dir: "#{recursor_dir}/recursor.d"
                                                                            forward_zones_file: "#{recursor_dir}/forward_zones.yml"
                                                                            threads: 2
                                                                        EOS
                                                                                     )
          end

          it 'includes forward_zones config in yaml format' do
            is_expected.to contain_file("#{recursor_dir}/forward_zones.yml").with('ensure' => 'file')
                                                                            .with_content(<<~EOS,
                                                                              ---
                                                                              - zone: "."
                                                                                forwarders:
                                                                                - 1.1.1.1
                                                                                recurse: true
                                                                            EOS
                                                                                         )
          end
        end
      end
    end
  end
end
