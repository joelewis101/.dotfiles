#!/bin/zsh
#
# Use op cli to extract password to encrypted files to use in .mbsyncrc
# and neomuttrc
#
#

if ! command -v op 2>&1 >/dev/null
then
    echo "op cli not found"
    echo "installing via homebroew"
    brew install op-cli
    echo "now go and set integrate withy 1password CLI is settings"
    echo "and rerun when you are done"
    exit 0
fi
#

echo "onepass cli found"
echo "getting and encrypting passwords..."
echo "doctors ..."
op item get doctors.org.uk --fields label=password --reveal > doctors_pwd.txt
/opt/homebrew/bin/gpg -r joelewis101@doctors.org.uk -e doctors_pwd.txt
rm doctors_pwd.txt
echo "done."


echo "lstmed..."
op item get b3arcx5zwfaldiqnb2pg5zjqs4 --fields label=password --reveal > lstmed_pwd.txt
/opt/homebrew/bin/gpg -r joelewis101@doctors.org.uk -e lstmed_pwd.txt
rm lstmed_pwd.txt
echo "done."

# /usr/local/bin/op item get oaluk6fksfet3mi37jzff5ls3q --fields label=password > uol_pwd.txt
# /opt/homebrew/bin/gpg -r joelewis101@doctors.org.uk -e uol_pwd.txt
# rm uol_pwd.txt
