#!/bin/sh

# map A to B
python3 test.py --dataroot ../standard_format/testA/ --name $1 --input_nc 1 --output_nc 1 --no_dropout --preprocess none --direction AtoB --model_suffix _A --results_dir fakeA

cd fakeA/$1/test_latest/images
# remove real images that were copied over
rm *_real.png
# rename fake images to original name
for i in *_fake.png
do 
  mv -v "$i" "$(echo "$i" | sed -e 's/_fake//')"
done
echo $PWD
cd -
echo $PWD
# map B to A
python3 test.py --dataroot ../standard_format/testB --name $1 --input_nc 1 --output_nc 1 --no_dropout --preprocess none --direction BtoA --model_suffix _B --results_dir fakeB

cd fakeB/$1/test_latest/images
# remove real images that were copied over
rm *_real.png
# rename fake images to original name
for i in *_fake.png
do 
  mv -v "$i" "$(echo "$i" | sed -e 's/_fake//')"
done

cd -

# now, collate the results into a useful structure

mkdir -p results/$1/fakeA
mv fakeA/$1/test_latest/images/* results/$1/fakeA
rm -r fakeA

mkdir -p results/$1/fakeB
mv fakeB/$1/test_latest/images/* results/$1/fakeB
rm -r fakeB
