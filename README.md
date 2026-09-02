Notes on books I read. Inspired by [How to Read a Book](https://en.wikipedia.org/wiki/How_to_Read_a_Book) by Mortimer Adler


To create symlink for setting up a new book:

```
chmod +x booknote.sh
sudo ln -s booknote.sh /usr/local/bin/booknote
```

Starting a new note:

```
booknote "The Mom Test" "Rob Fitzpatrick"
```

The filename comes from the title, and the title and author go in the header of the note, which is what the blog reads.
