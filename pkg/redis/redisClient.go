package redis

import (
	"os"
	"strings"

	"github.com/go-redis/redis"
)

func GetRedisClient() *redis.Client {
	redisHost, redisHostExists := os.LookupEnv("REDIS_HOST")
	if !redisHostExists {
		redisHost = "localhost"
	}

	redisPort, redisPortExists := os.LookupEnv("REDIS_PORT")
	if !redisPortExists {
		redisPort = "6379"
	}
	redisUrl := strings.Join([]string{redisHost, redisPort}, ":")

	return redis.NewClient(&redis.Options{
		Addr:       redisUrl,
		MaxRetries: 3,
	})
}
