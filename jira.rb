class JIRA
  def self.issues
    begin
      c = Curl::Easy.new(Options.jira_url)
      c.http_auth_types = :basic
      c.username = 'jira'
      c.password = ENV["JIRA_PASSWORD"]
      c.headers["Accept"] = "application/json"
      c.perform
      issues_raw_json = c.body_str
      issues_json_main = JSON.parse(issues_raw_json)
      issues_json = issues_json_main["issues"]
      issues_json.map {|i| Issue.new(i)}
    rescue
      puts "Unable to connect to JIRA!"
      raise
    end
  end
end
