


# get_local_packages() {
#   apm ls --installed --bare | grep -oP '(.+)(?=@)'
# }
#
# install_packages() {
#   # $1 list of package names
#
# }
#
# compare_local_and_remote() {
#   get_local_packages | diff ~/.atom/packages.txt - | grep "< " | install_packages
#   get_local_packages > ~/.atom/packages.txt
# }
