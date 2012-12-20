TorqueBox.configure do
  queue '/queues/urls' do
    processor UrlScrapper do
      concurrency 4
    end
  end

  topic '/topics/terms' do
    processor TermConsumer
  end

  service TwitterService do
    name 'twitter-service'
    config do
      consumer_key 'Consumer key'
      consumer_secret 'Consumer secret'
      access_token 'Access token'
      access_secret 'Access token secret'
    end
  end

  environment do
    POSTGRESQL_DB_HOST 'localhost'
    POSTGRESQL_DB_NAME 'poorsmatic'
    POSTGRESQL_DB_USER 'poorsmatic'
    POSTGRESQL_DB_PASS 'poorsmatic'
  end
end
