class Issue
  attr_accessor :id, :summary, :description

  def initialize(issue)
    fields = issue["fields"]
    @id = issue["key"].to_s
    @summary = fields["summary"]
    @description = fields["description"]
  end

  def to_s
    "[#{id}] - #{summary} \r\n\r\n#{description}\r\n\r\n\r\n\r\n"
  end

end
