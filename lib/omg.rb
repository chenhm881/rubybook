class OMG
  def initialize(app)
    @app = app
  end

  def call(env)
    #STDERR.write("\u00A0\u9648\u60E0\u660E\u662F\u53D8\u6001")
    @app.call(env)
  end
end