# frozen_string_literal: true

control 'Php package' do
  title 'should be installed'

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def test_debian
    describe package('php-imagick') do
      it { should be_installed }
    end

    describe package('php-redis') do
      it { should be_installed }
    end

    describe package('php-xdebug') do
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
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def test_redhat
    describe package('php') do
      it { should be_installed }
    end
  end

  def test_suse
    describe package('php7') do
      it { should be_installed }
    end
  end

  case os[:family]
  when 'debian'
    test_debian
  when 'redhat', 'fedora'
    test_redhat
  when 'suse'
    test_suse
  end
end
