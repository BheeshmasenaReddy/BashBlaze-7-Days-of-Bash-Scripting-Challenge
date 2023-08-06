for server in $(cat hosts.txt)
do
  for file in $(cat files.txt)
  do
    scp $file "$server":~
  done
done