require File.dirname(__FILE__) + '/boot.rb'

class ReleaseNotes
  issues = JIRA.issues
  issues.each do |i|
    print "Creating #{i.id}..."
    client = Octokit::Client.new(:login => 'githubuser', :password => 'githubpassword')
    created = client.create_issue('user|org/repo', i.summary, i.description)
    client.add_comment('user|org/repo', created.number, 'Imported from JIRA')
    print "Done\r\n\r\n"
  end
  puts "#{issues.count} issues imported."
end
