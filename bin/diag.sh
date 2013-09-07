sensors
echo $_
grep rate /proc/acpi/battery/BAT1/state
echo $_
grep rate /proc/acpi/battery/BAT2/state
echo $_
echo `acpi -b`
