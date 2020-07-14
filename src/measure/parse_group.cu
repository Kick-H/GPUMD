/*
    Copyright 2017 Zheyong Fan, Ville Vierimaa, Mikko Ervasti, and Ari Harju
    This file is part of GPUMD.
    GPUMD is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    GPUMD is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with GPUMD.  If not, see <http://www.gnu.org/licenses/>.
*/

/*-----------------------------------------------------------------------------------------------100
A function parsing the "group" option in some keywords
--------------------------------------------------------------------------------------------------*/

#include "model/group.cuh"
#include "parse_group.cuh"
#include "utilities/read_file.cuh"

void parse_group(
  char** param, const std::vector<Group>& groups, int& k, int& grouping_method, int& group_id)
{
  // grouping_method
  if (!is_valid_int(param[k + 1], &grouping_method)) {
    PRINT_INPUT_ERROR("grouping method should be an integer.\n");
  }
  if (grouping_method < 0) {
    PRINT_INPUT_ERROR("grouping method should >= 0.");
  }
  if (grouping_method >= groups.size()) {
    PRINT_INPUT_ERROR("grouping method should < number of grouping methods.");
  }

  // group_id
  if (!is_valid_int(param[k + 2], &group_id)) {
    PRINT_INPUT_ERROR("group ID should be an integer.\n");
  }
  if (group_id >= groups[grouping_method].number) {
    PRINT_INPUT_ERROR("group id should < number of groups.");
  }

  k += 2; // update index for next command
}