function count_nucleotides(input)
  return '0 0 0 0'
end

function append_from_table(data, func, collector)
  for i,val in ipairs(data) do
    table.insert(collector, func(val))
  end
end

function append_from_function(iterable, func, collector)
  for val in iterable do
    table.insert(collector, func(val))
  end
end

function string_iterator(str)
  return str:gmatch "%a"
end

function trim(str)
  return str:match "^%s*(.-)%s*$"
end

function length(input)
  return #input
end

function substring_counter(str, substring)
  return length(prune(str, substring))
end

function prune(str, keep)
  val = string.gsub(str, "[^"..keep.."]", "")
  return val
end

function map(data, func)
  local collector = {}
  if type(data) == 'table' then
    append_from_table(data, func, collector)
  elseif type(data) == 'function' then
    append_from_function(data, func, collector)
  end
  return collector
end

function reduce(data, memo, func)
  for i,val in ipairs(data) do
    memo = func(memo, val)
  end
  return memo
end
