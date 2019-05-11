class Api::V1::ApplicationController < ApplicationController
  include Api::Response
  include Api::ErrorHandler::RecordNotFound
end
