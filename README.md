# ShowAssist

Making it easy for people to track presale and sale dates for the artists they want to see.

## Setup

Clone the repo

```bash
git clone git@github.com:wjin17/showassist.git
```

Install dependencies

[Podman](https://podman.io/getting-started/installation)

```bash
brew install podman
```

[Podman Compose](https://github.com/containers/podman-compose)

```bash
pip3 install podman-compose
```

## Scripts

Start services

```bash
# for all services
podman-compose up -d

# for specific service
podman-compose up your-service -d
```

Stop services

```bash
# for all services
podman-compose down

# for specific service
podman-compose down your-service
```

Complete clean up, removes containers, images, and volumes

```bash
./clean_podman
```

Enter a container's shell

```bash
podman exec -it your-container /bin/bash
```

## Workflow

When working on the project, remember to run the following commands before doing any work.

```bash
# while on master branch
git pull origin master

# if there are changes and you have a new feature branch, switch to feature branch
git rebase master
```

When working on a new feature

```bash
# branch naming conventions: use all lowercase and separate words with a dash
git checkout -b branch-name

# save work in progress
git add .
git commit -m "your message here"

# when committing code, explain what was done using imperative language,
# e.g., "add twitter pipeline" instead of "added twitter pipeline"
```

Done with a new feature

```bash
# while on master branch
git pull origin master

# if there are changes and you have a new feature branch, switch to feature branch
git rebase master

git push origin branch-name
```

If there are any significant changes to the project, e.g., changing resources/updating database schema, be sure to update in the corresponding readme.

## Database

This is just a general outline, not a rigid definition. Please add detail where necessary and adjust the schemas accordingly.

- users and artists should be many to many
- artist and performer should be one to many
- perfomer and performer_resources should be one to many
- performer and show should be many to many
- show and presale should be one to many

```sql
TABLE user (
  id UNIQUE PRIMARY KEY
  first_name VARCHAR
  last_name VARCHAR
  date_created DATE
)

TABLE artist (
  id UNIQUE PRIMARY KEY
  name VARCHAR
  date_created DATE
)

TABLE performer (
  id UNIQUE PRIMARY KEY
  first_name VARCHAR
  last_name VARCHAR
  date_created DATE
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(id)
)

TABLE performer_resources (
  id UNIQUE PRIMARY KEY
  artist_id VARCHAR
  type VARCHAR
  data VARCHAR
  date_created DATE
  CONSTRAINT fk_performer FOREIGN KEY(performer_id) REFERENCES performer(id)
)

TABLE show (
  id UNIQUE PRIMARY KEY
  date DATE -- when the show is
  ticket_release DATE -- when tickets are available
  location VARCHAR
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(id)
)

TABLE presale (
  id UNIQUE PRIMARY KEY
  presale_code VARCHAR -- this may be null
  presale_release DATE -- when presale code available
  presale_date DATE -- when actual presale available
  date_created DATE
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(id)
  CONSTRAINT fk_show FOREIGN KEY(show_id) REFERENCES show(id)
)

```
