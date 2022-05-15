class ApplicationResource < Graphiti::Resource
    self.abstract_class = true
    self.adapter = Graphiti::Adapters::ActiveRecord
    self.base_url = Rails.application.routes
        .default_url_options[:host]
    self.endpoint_namespace = '/api/v1'

    paginate do |scope, current_page, per_page|
        scope.page(current_page).per(per_page)
    end
end
