# frozen_string_literal: true

control 'Php configuration' do
  title 'should match desired lines'

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def test_debian
    describe file('/etc/php/5.6/fpm/pool.d/radius-admin.conf') do
      its('content') { should include '[radius-admin]' }
      its('content') { should include 'php_admin_value[date.timezone] = Europe/Paris' }
    end

    describe file('/etc/php/7.3/fpm/pool.d/ldap-admin.conf') do
      its('content') { should include '[ldap-admin]' }
      its('content') { should include 'php_admin_value[date.timezone] = Europe/Paris' }
    end

    describe file('/etc/php/5.6/fpm/php.ini') do
      its('content') { should include 'date.timezone = Europe/Paris' }
    end

    describe file('/etc/php/7.3/fpm/php.ini') do
      its('content') { should include 'date.timezone = Europe/Paris' }
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def test_redhat; end

  def test_suse; end

  case os[:family]
  when 'debian'
    test_debian
  when 'redhat', 'fedora'
    test_redhat
  when 'suse'
    test_suse
  end
end
