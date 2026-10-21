# call in terminal with: bash job.sh
for s in \
"base" 
do
   bsub -env scenario=$s < submit.sh
done

# "8x56_CostRed" \
# "8x56_NewTech" \
# "8x56_SetPlan1" 