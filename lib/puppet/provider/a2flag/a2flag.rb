require 'puppet/util/filetype'
Puppet::Type.type(:a2flag).provide(:a2flag) do
    desc "Manage Apache 2 flags for SuSE"

    commands :encmd => "a2enflag"
    commands :discmd => "a2disflag"

    defaultfor :operatingsystem => [:suse, :opensuse, :sles, :sled]
    confine    :operatingsystem => [:suse, :opensuse, :sles, :sled]

    def create
        encmd resource[:name]
    end

    def destroy
        discmd resource[:name]
    end

    def exists?
        # probably not the most efficent way to do this but it works;-)
	conf_val = ""
        File.open("/etc/sysconfig/apache2") .each do |line|
            if line =~ /^APACHE_SERVER_FLAGS=/
               conf_val = line
            end
        end
	if conf_val.gsub(/APACHE_SERVER_FLAGS="/, "").gsub(/"\n/, "" ) =~ /\b#{Regexp.escape(@resource[:name])}\b/
		return true
	else
		return false
	end
    end
end
