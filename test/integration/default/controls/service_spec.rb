control 'Php service' do
  title 'should be running and enabled'

  def test_debian
    describe service('php5.6-fpm') do
      it { should be_enabled }
      it { should be_running }
    end

    describe service('php7.3-fpm') do
      it { should be_enabled }
      it { should be_running }
    end
  end

  def test_ubuntu
    describe service(pkg_name) do
      it { should be_enabled }
      it { should be_running }
    end
  end

  def test_redhat
  end

  def test_suse
  end

  case os[:family]
  when 'debian'
    case os[:name]
    when 'ubuntu'
      test_ubuntu
    when 'debian'
      test_debian
    end
  when 'redhat', 'fedora'
    test_redhat
  when 'suse'
    test_suse
  end
end
