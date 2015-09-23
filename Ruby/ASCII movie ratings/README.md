ASCII IMDB movies
======================

No tests implemented yet.

Ruby Version: 2.2.2

To run it, do :

- Clone the repo or copy the files
- Bundle install
- To execute the script, run the 'main.rb' script or build it in your favorite text editor

DESCRIPTION
======================

We are creating a awesome ASCII chart for comparing ratings of movies in IMDB.
We will be using IMDB Gem.
The expected output is something like this

| |#|#| | | | |
|#|#|#| | | | |
|#|#|#| | |#| |
|#|#|#| | |#| |
|#|#|#| | |#| |
|#|#|#|#| |#| |
|#|#|#|#|#|#| |
|#|#|#|#|#|#|#|
---------------
|1|2|3|4|5|6|7|

1. Ghostbusters
2. Die Hard
3. The Godfather
4. Home alone
5. Star trek, the new generation
6. The night of the living dead
7. Titanic

Those sharp signs are supposed to be vertical bars.
We will specify the movies in an external file called movies.txt. We should search IMDB for the title in the text file and accept the first result as correct.

Ghostbusters
Die Hard
The Godfather
Home alone
Star trek, the new generation
The night of the living dead
Titanic

The program must make a search in IMDB and show the same number of sharp signs as the rating of the movie rounded to the closest number.
