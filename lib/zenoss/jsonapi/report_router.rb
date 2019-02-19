#############################################################################
# Copyright © 2010 Dan Wanek <dwanek@nd.gov>
#
#
# This file is part of zenoss_client.
# 
# zenoss_client is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# zenoss_client is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with zenoss_client.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################
module Zenoss
  module JSONAPI
    module ReportRouter

      def get_report_types
        json_request('ReportRouter', 'getReportTypes')
      end

      def get_report_tree(id = '/zport/dmd/Reports')
        if @zenoss_version && @zenoss_version > '6'
          json_request('ReportRouter', 'asyncGetTree', [id])
        else
          json_request('ReportRouter', 'getTree', [{:id => id}])
        end
      end

    end # ReportRouter
  end # JSONAPI
end # Zenoss
