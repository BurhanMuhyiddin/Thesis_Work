#!/usr/bin/env python3.9
# Copyright (c) 2009, Willow Garage, Inc.
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Willow Garage, Inc. nor the names of its
#       contributors may be used to endorse or promote products derived from
#       this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

# Author: Stuart Glaser

import sys
try:
    from cStringIO import StringIO
except ImportError:
    from io import StringIO
import re
import os, os.path
import errno
from optparse import OptionParser

IODELIM   = '---'
AUTOGEN="# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"

class ActionSpecException(Exception): pass

def parse_action_spec(text, package_context = ''):
    pieces = [StringIO()]
    for l in text.split('\n'):
        if l.startswith(IODELIM):
            pieces.append(StringIO())
        else:
            pieces[-1].write(l + '\n')
    return [p.getvalue() for p in pieces]

def write_file(filename, text):
    f = open(filename, 'w')
    f.write(text)
    f.close()

def main():

    parser = OptionParser("Actionlib generator")
    parser.add_option('-o', dest='output_dir',
                      help='output directory')

    (options, args) = parser.parse_args(sys.argv)

    pkg = os.path.abspath(sys.argv[1])
    filename = sys.argv[2]

    output_dir = options.output_dir

    # Try to make the directory, but silently continue if it already exists
    try:
        os.makedirs(output_dir)
    except OSError as e:
        if e.errno == errno.EEXIST:
            pass
        else:
            raise

    action_file = args[1]
    if not action_file.endswith('.action'):
        print("The file specified has the wrong extension. It must end in .action")
    else:
        filename = action_file

        f = open(filename)
        action_spec = f.read()
        f.close()

        name = os.path.basename(filename)[:-7]
        print("Generating for action %s" % name)

        pieces = parse_action_spec(action_spec)
        if len(pieces) != 3:
            raise ActionSpecException("%s: wrong number of pieces, %d"%(filename,len(pieces)))
        goal, result, feedback = pieces

        action_msg = AUTOGEN + """
%sActionGoal action_goal
%sActionResult action_result
%sActionFeedback action_feedback
""" % (name, name, name)

        goal_msg = AUTOGEN + goal
        action_goal_msg = AUTOGEN + """
Header header
actionlib_msgs/GoalID goal_id
%sGoal goal
""" % name

        result_msg = AUTOGEN + result
        action_result_msg = AUTOGEN + """
Header header
actionlib_msgs/GoalStatus status
%sResult result
""" % name

        feedback_msg = AUTOGEN + feedback
        action_feedback_msg = AUTOGEN + """
Header header
actionlib_msgs/GoalStatus status
%sFeedback feedback
""" % name

        write_file(os.path.join(output_dir, "%sAction.msg"%name), action_msg)
        write_file(os.path.join(output_dir, "%sGoal.msg"%name), goal_msg)
        write_file(os.path.join(output_dir, "%sActionGoal.msg"%name), action_goal_msg)
        write_file(os.path.join(output_dir, "%sResult.msg"%name), result_msg)
        write_file(os.path.join(output_dir, "%sActionResult.msg"%name), action_result_msg)
        write_file(os.path.join(output_dir, "%sFeedback.msg"%name), feedback_msg)
        write_file(os.path.join(output_dir, "%sActionFeedback.msg"%name), action_feedback_msg)


if __name__ == '__main__': main()
