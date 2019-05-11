module Api::Response
  def render_json(object, scope, status = :ok)
    render json: object, scope: scope, status: status
  end

  def render_errors(errors, status = :bad_request)
    render json: { errors: errors }, status: status
  end
end
