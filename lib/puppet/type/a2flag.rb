Puppet::Type.newtype(:a2flag) do
    @doc = "Manage Apache 2 flags on SuSE"
 
    ensurable

    newparam(:name) do
       desc "The name of the flag to be managed"

       isnamevar

    end 
end
