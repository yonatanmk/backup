Minimum Viable Product:

I want to create an app that allows users to organize movies that they have seen and movies that they want to see. After they log in, a user will be able to fill out a form with the name or partial name of a movie. Upon submission of the form, I want to populate the page with movies relevant to the form input using the Movie Database API. Users will then have the option of marking the movies that show up as either movies they’ve already seen or movies that they plan to see. Users will then be able to navigate to their home page where they’ll be able to see all the movies that they’ve selected, all organized into either movies they’re already seen or movies that they plan to see. I will use React to display the movies.

User can input movie information into search form
	-submission of form results in movies populating the page

User can view certain information about each movie
	-movie displays name
-movie displays description
-movie displays image
-movie displays release-date

User can mark movies as “already seen”
	-clicking on a button will mark a listed movie as “already seen”
	-marked movie no longer appears on the page

User can mark movies as “plan to watch”
	-clicking on a button will mark a listed movie as “plan to watch”
	-marked movie no longer appears on the page

User can view “already seen” and “plan to watch” movies on their homepage
	-user cannot view information from other users
	-“already seen” and “plan to watch” movies are appropriately organized and separated

User can remove movies from homepage
	-Clicking on a certain button will delete movie from homepage and database

User can change status of movies on homepage
-user can change a movie from “plan to watch” to “already seen” and vice versa by clicking a button





Extra Features:

As extra goals I want to display more information about the movies. I also want to add a feature where a user can mark certain movies that they have seen as favorites. Based on the user’s favorites, I want to create a new suggestions page where the user can click a button and the page will generate a movie that the user has not yet seen based on the movies that they have “liked”. If I REALLY have a lot of time at the end, I can expand this feature to books/tv shows as well.


User stories

User can view extra movie information including leading cast members, genres, and IMDB Rating.
	-listed movies display 3 most prominent cast members
	-listed movies display genres
	-listed movies display IMDB rating

Users can like and unlike movies.
	-clicking on a button will mark the movie as liked
-clicking on a button again will mark the movie as normal

User can navigate to a page where they can click a button to generate a div containing a new movie that they have not seen before based on their “liked” movies.
	-user can navigate to new page
	-clicking button displays a new movie with all it’s information

APIs of interest:
The Movie Database API
The TasteKid API for Movie Recommendations
