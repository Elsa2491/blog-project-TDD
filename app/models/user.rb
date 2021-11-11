class User < ApplicationRecord
  def import
    uri = 'https://jsonplaceholder.typicode.com/users'
    content = call_api(uri)
    user = JSON.parse(content)
    user.first()['name']
  end

  private

  def call_api(uri)
    Net::HTTP.get(URI.parse(uri))
  end
end
