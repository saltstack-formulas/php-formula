control 'Php package' do
  title 'should be installed'



  def test_debian
    describe package('php-imagick') do
      it { should be_installed }
    end

    describe package('php-redis') do
      it { should be_installed }
    end

    %w[
      bz2 cli curl fpm gd imap intl mbstring
      mysql readline xml zip
    ].each do |pkg|

      describe package("php5.6-#{pkg}") do
        it { should be_installed }
      end

      describe package("php7.3-#{pkg}") do
        it { should be_installed }
      end
    end
  end

  def test_ubuntu
    describe package(pkg_name) do
      it { should be_installed }
    end
  end

  def test_redhat
    describe package('php') do
      it { should be_installed }
    end
  end

  def test_suse
    describe package('php5') do
      it { should be_installed }
    end
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
