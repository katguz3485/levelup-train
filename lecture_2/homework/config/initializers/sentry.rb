Raven.configure do |config|
  config.dsn = 'https://ddef8c957a064d3da1e393fefdf77696:011c4abec5804d79ad0a70f0a86922d2@sentry.io/1468252'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end