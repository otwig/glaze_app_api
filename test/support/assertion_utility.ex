defmodule GlazeApi.AssertionUtility do
  import Phoenix.ConnTest

  def contents_equal?(list1, list2) when is_list(list1) and is_list(list2),
    do: Enum.sort(list1) == Enum.sort(list2)

  def contents_ids_equal?(list1, list2) when is_list(list1) and is_list(list2) do
    list1 = Enum.map(list1, & &1.id)
    list2 = Enum.map(list2, & &1.id)
    contents_equal?(list1, list2)
  end

  # Extracts ids as integers from conn of successful GET request (index)
  def ids_from_resp(resp_conn),
    do: Enum.map(json_response(resp_conn, 200)["data"], &String.to_integer(&1["id"]))

  # Given a list of records and a conn, returns true if those records are ALL
  # included in the same sorted order
  def sorted_records_in_resp?(records, resp_conn) when is_list(records),
    do: ids_from_resp(resp_conn) == Enum.map(records, & &1.id)

  # Given a list of records and a conn, returns true if those records are ALL
  # included in the json response and are the ONLY records in that response
  def only_records_in_resp?(records, resp_conn) when is_list(records) do
    ids = Enum.map(records, & &1.id)
    resp_ids = ids_from_resp(resp_conn)
    contents_equal?(ids, resp_ids)
  end
end
