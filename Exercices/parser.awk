#!/usr/bin/awk
{
FS="\t"
if ($2 ~ /Location.*/)
{
  print $3
}
}
