class Service
  include ActiveModel::Validations

  class << self
    def perform(*args, **kwargs, &block)
      new(*args, **kwargs, &block).call
    end
  end

  def initialize(*args, **kwargs)
    return unless defined?(self.class::Input)

    if args.count == 1 && args.first.is_a?(self.class::Input)
      @input = args[0]
    elsif args.count.zero?
      @input = self.class::Input.new(**kwargs)
    end
  end

  def perform
    raise NotImplementedError, "#{self.class.name} must implement method #perform"
  end

  def call
    @success = false
    perform

    raise StandardError, 'service has errors after performing' if errors.any?

    @success = true
    self
  rescue StandardError => e
    errors.add(:base, e.message)
    self
  end

  def success?
    @success == true
  end

  def failure?
    @success == false
  end
end
