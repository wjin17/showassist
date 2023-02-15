# Data Engineering

This portion of the project will focus on gathering the presale and sale dates of concerts

## Objectives

- Design a pipeline that extracts the following information using APIs and web scraping

  1. Artist
  2. Presale Code Release Date
  3. Presale Date
  4. Presale Code
  5. Concert Date

- Design a Postgres database to store and query the data

- Design a pipeline that will be able to perform a search once a week and store relevant data accordingly

- Scale the pipeline to work for many users

## Resources

The data will be gathered from the following resources

### Artist Selection

- User's top 100 artists

### Social Media

1. Twitter
2. Instagram

### Ticket Sales

1. Ticketmaster
2. AXS
3. Dice.fm

## Roadmap

Initial goals to final product

### Proof of Concept

- Get a list of 10 artists
- Extract info about their concert data
- Setup a postgres database using docker
- Store the data in the database

### V1

- Expand the list to 100 artists

### V2

- Setup a way to run a scrape once a week

## Database

See main readme for [db info](../README.md/#database)
