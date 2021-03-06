# encoding: utf-8
# bofh_gen.rb

class BastardOperatorsFromHellGen
  def initialize
    @first_term = %w( Temporary Intermittant Partial Redundant Total Multiplexed
                      Inherent Duplicated Dual-Homed Synchronous Bidirectional
                      Serial Asynchronous Multiple Replicated Non-Replicated
                      Unregistered Non-Specific Generic Migrated Localised
                      Resignalled Dereferenced Nullified Aborted Serious Minor Major
                      Extraneous Illegal Insufficient Viral Unsupported Outmoded
                      Legacy Permanent Invalid Deprecated Virtual Unreportable
                      Undetermined Undiagnosable Unfiltered Static Dynamic Delayed
                      Immediate Nonfatal Fatal Non-Valid Unvalidated Non-Static
                      Unreplicatable Non-Serious )
    @second_term = %w( Array Systems Hardware Software Firmware Backplane
                       Logic-Subsystem Integrity Subsystem Memory Comms Integrity
                       Checksum Protocol Parity Bus Timing Synchronisation Topology
                       Transmission Reception Stack Framing Code Programming
                       Peripheral Environmental Loading Operation Parameter Syntax
                       Initialisation Execution Resource Encryption Decryption
                       File Precondition Authentication Paging Swapfile Service
                       Gateway Request Proxy Media Registry Configuration Metadata
                       Streaming Retrieval Installation Library Handler )
    @third_term = %w( Interruption Destabilisation Destruction Desynchronisation
                      Failure Dereferencing Overflow Underflow NMI Interrupt
                      Corruption Anomaly Seizure Override Reclock Rejection
                      Invalidation Halt Exhaustion Infection Incompatibility Timeout
                      Expiry Unavailability Bug Condition Crash Dump Crashdump
                      Stackdump Problem Lockout )
    @option_term = ['', 'Error', '', 'Problem', '', 'Warning', '', 'Signal', '', 'Flag', '', 'Alert', '']
  end

  def generate
    "#{(a = @option_term.sample).empty? ? '': a +': ' }#{@first_term.sample} #{@second_term.sample} #{@third_term.sample}."
  end

  def extract
    #########
    # Ruby: What's an elegant way to pick a random line from a text file?
    # answer: http://stackoverflow.com/a/11007320/11594
    file = File.join(Sinatra::Application::settings.root, '/resources/bofh_excuses.txt')
    line = File.foreach(file).each_with_index.reduce(nil) { |picked, pair| rand < 1.0 / (1 + pair[1])? pair[0]: picked }
    line.chomp
  end
end
