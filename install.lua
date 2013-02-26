require "lfs"
require "os"

function main()
    home = os.getenv("HOME")
    for dotfile in lfs.dir(".") do
        dotfilePath = lfs.currentdir().."/"..dotfile
        dotfileAttr = lfs.attributes(dotfilePath)
        if dotfileAttr.mode == "file" and dotfile:sub(0, 1) ~= "." and dotfile ~= "install.lua" then
            linkPath = home.."/."..dotfile
            linkAttr = lfs.symlinkattributes(linkPath)
            if linkAttr == nil or linkAttr.mode == "link" then
                os.remove(linkPath)
                lfs.link(dotfilePath, linkPath, true)
            else
                repeat
                    io.write("Overwrite "..linkPath.."? [Y/n] ")
                    ans = io.read():lower():sub(0, 1)
                    if ans == "" then
                        ans = "y"
                    end
                until ans == "y" or ans == "n"
                if ans == "y" then
                    os.remove(linkPath)
                    lfs.link(dotfilePath, linkPath, true)
                end
            end
        end
    end
end

--function trim()
--end

main()
