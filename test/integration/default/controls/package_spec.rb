control 'Php package' do
  title 'should be installed'

  pkg_name =
    case os[:family]
    when 'debian', 'redhat', 'fedora'
      'php'
    when 'suse'
      'php5'
    end

  describe package(pkg_name) do
    it { should be_installed }
  end
end
