$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
require 'rubygems'
require 'rest_client'
require 'json'
require 'issues'
require 'issue'
require 'settings'
require 'jira'
require 'teamcity'
require 'deployer'
require 'curb'
require 'octokit'

Options.config do
  jira_url "https://jira.example.com/rest/api/2/search?jql=status%20not%20in%20(Done)&maxResults=100"
end
