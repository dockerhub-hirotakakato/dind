require 'spec_helper'

describe port(2376) do
  it { should be_listening }
end
