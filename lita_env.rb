module Lita
  def self.env
    ENV["LITA_ENV"] || :production
  end

  def self.env?(env=:production)
    self.env.to_s == env.to_s
  end
end
