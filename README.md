# criclive
1. docker-compose -f docker-compose-db.yml up -d
2. npx knex migrate:up 20250520161903_001.js --> to do the migration
3. docker exec -it cricket-db psql -U cricket_admin -d cricket_app
4. \d+ (All the tables should be added after migration)
5. migrations file ran will be stored here: knex_migrations
