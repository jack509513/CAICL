#!/usr/bin/env bash

set -x

EXP_DIR=exps/two_stage/deformable-detr-hybrid-branch/12eps/r50_hybrid_branch_lambda1_group2_t600_dp0_mqs_lft_deformable_detr_plus_iterative_bbox_refinement_plus_plus_two_stage
PY_ARGS=${@:1}

python -u main.py \
    --output_dir ${EXP_DIR} \
    --with_box_refine \
    --two_stage \
    --dim_feedforward 2048 \
    --epochs 12 \
    --lr_drop 11 \
    --num_queries_one2one 300 \
    --num_queries_one2many 600 \
    --k_one2many 2 \
    --lambda_one2many 1.0 \
    --dropout 0.0 \
    --mixed_selection \
    --look_forward_twice \
    ${PY_ARGS}
