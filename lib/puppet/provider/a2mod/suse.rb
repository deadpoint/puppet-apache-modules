Puppet::Type.type(:a2mod).provide(:suse) do
    desc "Manage Apache 2 modules on SuSE"
 
    commands :encmd => "a2enmod"
    commands :discmd => "a2dismod"
 
    defaultfor :operatingsystem => [:suse, :opensuse, :sles, :sled]
    confine    :operatingsystem => [:suse, :opensuse, :sles, :sled]

    def create
        encmd resource[:name]
    end
 
    def destroy
        discmd resource[:name]
    end
 
    def exists?
        if encmd("-l") =~ /\b#{Regexp.escape(@resource[:name])}\b/
           return true
        else
           return false
        end
    end
end
