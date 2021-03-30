# Splitting a string by a delimiter
E.g. splitting $PATH by :

    echo $PATH | sed 's/:/\n/g'
