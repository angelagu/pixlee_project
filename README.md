# Pixlee Coding Project

http://pixlee-project.herokuapp.com/

## Setup

Clone the project and run the following commands in the project directory:

* `bundle install`
* `rake db:migrate`

## To Run Locally

* `rails s`
* go to localhost:3000 in your browser


## Summary

This project displays a list of Instagram photos that contain a certain hashtag that were created within a date range. It uses the Instagram Ruby gem to make the API call. When the user performs a search, the search criteria (tag name, start date, and end date) is stored in the database. Then, the photos are fetched by calling Instagram API's tag endpoint. The photos are filtered using the date range specified, and the IDs of the photos are used as cursors for pagination. The filtered photos are added to the database and linked with the tag that was for the search through a `has_and_belongs_to_many` relationship.

Right now, the rendering is done synchronously. In other words, the frontend has to wait for the backend to finish fetching the entire set of results before rendering anything. This causes the system to hang if the set of photos associated with the hashtag is very large because it will take a long time to get all the photos. Also, currently, the results are stored in-memory, so the system can easily run out of memory if the batch of photos is huge. 

For example, this search works well since there aren't many photos with that tag:

Tag: #torontoadventures
Start Date: December 21, 2015
End Date: December 29, 2015

However, this will crash the system:

Tag: #cats
Start Date: December 21, 2015
End Date: December 29, 2015

Ideally, the frontend should be separated from the backend, and the whole system should work asynchronously. The calling of the API endpoint should be made into a batch job and the frontend should be getting the data from the database storage. If there aren't any posts in the database with the search parameter, a batch job can be kicked off to fetch the posts. When the current page of posts are fetched, the backend can send a response to the frontend, in which case the frontend can grab the new posts while the batch job proceeds with fetching the next page of results. This avoids having to store the entire set of results in memory because the frontend is getting the data from the database. 

How to minimize the amount of API hits, and thus minimize the chance of hitting the rate limit on the token?

There are a number of ways to reduce unnecessary API calls and better manage the amount of calls. For example, spacing out the API calls as evenly as possible to avoid sharp spikes and side-loading API calls. 

How to elegantly handle the case of your end date being in the future, or a lack of an end date?

Right now, a lack of either start or end date is given the current date.
