# Homeworks

The course has four homeworks with main goal to build a summary project. Each task in the homework could be individual or team scoped - pay attention to comments!

To pass the course, you must get at least 60 points.

## Homework requirements

- Each student maintains a git repository with completed tasks (code, docs, images)
- In case of group tasks, only one copy is sufficient. For example, one student repository has the group results, the rest of teammates reference this repo
- You can pick any cloud platform of your choice

## Capstone project

- Capstone project should include 5+ cloud services.
- You can peak any project you worked on in previous courses (event-streaming, distributed systems, system architecture, etc) and reimplement it in a cloud of your choice.
- Or you can implement your own idea ;)

### Project ideas

- Fridges emit telemetry: target and current temperature, door is opened or closed. Cloud saves the data; allows temperature trends queries; alerts if door is opened more than 30 seconds or if target temperature is not equal to target.
- Social media data ingestion. Enrich data with sentiment; calculate trends: most used words every hour/day; most popular sentiment by time of the day.
- Play with stackoverflow [public data dump](https://www.brentozar.com/archive/2021/03/download-the-current-stack-overflow-database-for-free-2021-02/): stream messages, store  a subset of data and analyse it: most used or most voted tools/languages/frameworks per day/month, most commented posts
- Analyze you spotify listening habits: listening time per month, analyze [tracks features](https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-several-audio-features), stream new tracks
- ...


## List of tasks

There are mandatory and bonus tasks.

Cloud computing landscape is too large to cover each and every bit within a few learning sessions. While mandatory tasks are focused on the most important aspects of developing your project within a cloud environment, bonus tasks cover topics that are less visible at first, but important for project to succeed in a long run.

### Mandatory tasks

Each mandatory task has a deadline date. Finishing homeworks after deadline date is allowed, but final score will be reduced by 1 point for each overdue day (not more than -20 for a single homework-day).

Note, mandatory tasks are required to complete the course even if due missed deadline you are getting minimum or no points at all.

| Day | Task Name                | Points |
| --- | ------------------------ | ------ |
| 1   | Create team              |   5    |
|     | Register cloud account   |   5    |
|     | Terraform intro          |   10   |
| --- | ------------------------ | ------ |
| 2   | Project description      |   15   |
|     | FaaS sample              |   15   |
| --- | ------------------------ | ------ |
| 3   | Proof of concept (PoC)   |   30   |
| --- | ------------------------ | ------ |
| 4   | Pricing calculator       |   20   |
| --- | ------------------------ | ------ |
|     |                          |   100  |

### Bonus tasks

Bonus tasks are not required to get the final grade. You can use this part to:

- build close to production-grade system;
- compensate missed deadlines.

| Day | Task Name                | Points |
| --- | ------------------------ | ------ |
| 3   | Terraform config for PoC |   20   |
|     | Security                 |   15   |
|     | Disaster recovery        |   15   |
| --- | ------------------------ | ------ |
| 4   | Observability            |   20   |
|     | Autoscaling              |   10   |
