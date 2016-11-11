def merge_sort(array)
  print array
  array = everyone_gets_2_rocks(array,array.length)
  print array
  array = everyone_gets_4_rocks(array,array.length)
  print array
  array = last_group_to_sort(array,array[0..3],array[4..8])
  print array
end

def everyone_gets_2_rocks(array,array_length,sort1 = [])
  return sort1 if array_length == sort1.length
  if array[-2] > array[-1]
    sort1 << array[-1]
    sort1 << array[-2]
  else
    sort1 << array[-2]
    sort1 << array[-1]
  end
  array.pop
  array.pop
  everyone_gets_2_rocks(array,array_length,sort1) if array_length >= sort1.length
end

def everyone_gets_4_rocks(arr,arr_amount,sort2 =[])
  return sort2 if arr_amount <= 0
  if arr[arr_amount - 4] > arr[arr_amount - 2]
    sort2 << arr[arr_amount - 2]
    sort2 << arr[arr_amount - 4]
    if arr[arr_amount - 3] > arr[arr_amount - 1]
      sort2 << arr[arr_amount - 1]
      sort2 << arr[arr_amount - 3]
    else
      sort2 << arr[arr_amount - 3]
      sort2 << arr[arr_amount - 1]
    end
  else 
    sort2 << arr[arr_amount - 4]
    sort2 << arr[arr_amount - 2]
    if arr[arr_amount - 3] > arr[arr_amount - 1]
      sort2 << arr[arr_amount - 1]
      sort2 << arr[arr_amount - 3]
    else
      sort2 << arr[arr_amount - 3]
      sort2 << arr[arr_amount - 1]
    end
  end
  arr_amount -= 4
  everyone_gets_4_rocks(arr,arr_amount,sort2)
end

def last_group_to_sort(arr,arr1,arr2,final_sort = [])  
  if arr1.length == 0
    final_sort << arr2.shift
    return final_sort if arr.size == final_sort.size
    last_group_to_sort(arr,arr1,arr2,final_sort)
  elsif arr1[0] > arr2[0]
    final_sort << arr2.shift
  else
    final_sort << arr1.shift
  end
  return final_sort if arr.size == final_sort.size
  last_group_to_sort(arr,arr1,arr2,final_sort)
end
array = [2,5,3,8,9,12,45,34]
print merge_sort(array)                #only works with  8  in array

#[ 2, 5, 3, 8, 9, 12, 45, 34]
#[34, 45, 9, 12, 3, 8, 2, 5]
#[2, 3, 5, 8,        9, 34, 12, 45]   <<< NEEDS FIXING
#[2, 3, 5, 8, 9, 34, 12, 45]