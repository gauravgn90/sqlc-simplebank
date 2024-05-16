postgres:
	docker run --name  postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root postgres:12-alpine
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgres12 dropdb simple_bank
migrate-up:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose up
migrate-down:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate

.PHONY: createdb, dropdb, postgres, migrate-up, migrate-down, sqlc