# frozen_string_literal: true

# Handles all errors within entire app
module ErrorHandler
  # Reports error to log with backtrace
  # @param error [StandardError]
  def log_error(error, custom_error_message = nil)
    # It is alternative method of `log_error()` created to resolve the issue #3069
    # See comments here: https://github.com/jpmobiletanaka/minpaku_dashboard/issues/3069
    logger.error(prepared_error_message(error, custom_error_message))
  end

  # Reports info message to log
  # @param info_message [String]
  def log_info(info_message)
    logger.info(info_message)
  end

  # Reports debug message to log
  # @param debug_message [String]
  def log_debug(debug_message)
    logger.debug(debug_message)
  end

  def log_warn(warn_message)
    logger.warn(warn_message)
  end

  # Prepares error message
  # @param error [StandardError]
  # @param custom_error_message [String]
  def prepared_error_message(error, custom_error_message = nil)
    if error
      backtrace = error.backtrace.nil? ? 'trace is empty' : error.backtrace.join("\n\t")
      backtrace = "[#{Time.zone.now.strftime('%FT%T%:z')}]\n#{backtrace}"
      return "#{custom_error_message}\n#{error.class}: #{error.message}\n#{backtrace}" if custom_error_message.present?

      "#{error.class}: #{error.message}\n#{backtrace}"
    else
      custom_error_message
    end
  end

  # Reports metrics data reporter errors to prevent looping
  # @param error [StandardError]
  def log_aspect_error(error)
    logger.error(error)
  end

  def logger
    @logger ||= Rails.logger
  end
end
