package ${package}.ships;

// This class is straight up yoinked from starlance, I should probably simplify it at some point
public class TeleportHandler {
    
    /*private final Map<Long, Vector3d> shipToPos = new HashMap<>();
    private final LoadedServerShipWorldCore shipWorld;
    private double greatestOffset;
    private final ServerLevel newDim;
    private final ServerLevel originalDim;
    private final boolean highestShipPriority;
    
    public TeleportHandler(ServerLevel newDim, ServerLevel originalDim, boolean highestShipPriority) {
        shipWorld = VSGameUtilsKt.getShipObjectWorld(newDim);
        this.newDim = newDim;
        this.originalDim = originalDim;
        this.highestShipPriority = highestShipPriority;
    }
    
    public void handleTeleport(Ship ship, Vector3d newPos) {
        // The user has done a woopsie, transform to world
        if (VSGameUtilsKt.isBlockInShipyard(this.newDim, newPos.x, newPos.y, newPos.z)) {
            // If the position we teleport to is in the shipyard, we stack overflow
            Ship posShip = VSGameUtilsKt.getShipManagingPos(this.newDim, newPos);
            if (posShip != null) {
                newPos = posShip.getTransform().getShipToWorld().transformPosition(newPos);
            }
        }
        collectShips(ship, newPos);
        handleTeleport();
    }

    
    
    private void collectConnected(Long currentPhysObject, Vector3dc origin, Vector3d newPos) {
        if (currentPhysObject == null) return;
            if (shipToPos.containsKey(currentPhysObject)) return;

            Set<Integer> constraints = shipIdToConstraints.get(currentPhysObject);
            Vector3dc pos = transformFromId(currentPhysObject, shipWorld).getPositionInWorld();

            double offset = pos.get(1) - origin.get(1);

            offset *= highestShipPriority ? 1 : -1;
            if (offset > greatestOffset) greatestOffset = offset;

            shipToPos.put(currentPhysObject, pos.sub(origin, new Vector3d()).add(newPos, new Vector3d()));
            if (constraints != null) {
                constraints.iterator().forEachRemaining(id -> {
                VSConstraint constraint = constraintIdToConstraint.get(id);
                collectConnected(constraint.getShipId0(), origin, newPos);
                collectConnected(constraint.getShipId1(), origin, newPos);
            });
        }
    }
    
    private void collectShips(Ship ship, Vector3d newPos) {
        Vector3dc origin = ship.getTransform().getPositionInWorld();
        collectConnected(ship.getId(), origin, newPos);
        collectNearby(origin, newPos);
    }
    
    private void collectNearby(Vector3dc origin, Vector3d newPos) {
        Map<Long, Vector3d> newShipToPos = new HashMap<>();

        shipToPos.keySet().forEach(id -> {

            if (shipToPos.containsKey(id)) return;

            QueryableShipData<LoadedLoadedServerShip> loadedShips = shipWorld.getLoadedShips();
            Ship ship = loadedShips.getById(id);

            if (ship == null) return;

            loadedShips.getIntersecting(VectorConversionsMCKt.toJOML(VectorConversionsMCKt.toMinecraft(ship.getWorldAABB()).inflate(10))).forEach(
                intersecting -> newShipToPos.put(intersecting.getId(), intersecting.getTransform().getPositionInWorld().sub(origin, new Vector3d()).add(newPos, new Vector3d()))
            );
        });
        shipToPos.putAll(newShipToPos);
    }
    
    private void handleTeleport() {
        greatestOffset *= highestShipPriority ? -1 : 1;
        shipToPos.forEach((id, newPos) -> {
            dismountEntities(id);
            handleShipTeleport(id, newPos);
        });
    }
    
    private void dismountEntities(Long id) {
        LoadedServerShip ship = shipWorld.getLoadedShips().getById(id);
        if (ship == null) return;
        AABB inflatedAABB = VectorConversionsMCKt.toMinecraft(ship.getWorldAABB()).inflate(20);
        originalDim.getEntities(null, inflatedAABB).forEach((entity) -> {
            entity.dismountTo(entity.getX(), entity.getY(), entity.getZ());
        });
    }
    
    private void handleShipTeleport(Long id, Vector3d newPos) {
        String vsDimName = ((DimensionIdProvider) newDim).getDimensionId();

        LoadedServerShip ship = shipWorld.getLoadedShips().getById(id);
        if (ship == null) {
            PhysicsEntityServer physEntity = ((ShipObjectServerWorld) shipWorld).getLoadedPhysicsEntities().get(id);
            if (physEntity == null) {
                return;
            }
            // TODO: always sets scale to 1 find way to get scale from physEntity
            final ShipTeleportData teleportData = new ShipTeleportDataImpl(targetPos, physEntity.getShipTransform().getShipToWorldRotation(), physEntity.getLinearVelocity(), physEntity.getAngularVelocity(), vsDimName, 1.0, null);
            shipWorld.teleportPhysicsEntity(physEntity, teleportData);
        }
		final ShipTeleportData teleportData = new ShipTeleportDataImpl(targetPos, ship.getTransform().getShipToWorldRotation(), veloctiy, omega, vsDimName, 1.0, null);
        shipWorld.teleportShip(ship, teleportData);
    }
    
    private static ShipTransform transformFromId(Long id, LoadedServerShipWorldCore shipWorld) {
        Ship ship = shipWorld.getAllShips().getById(id);
        if (ship == null) {
            PhysicsEntityServer physicsEntity = ((ShipObjectServerWorld)shipWorld).getLoadedPhysicsEntities().get(id);
            // TODO: find new way to make empty transform
            //if (physicsEntity == null) return new ShipTransformImpl(new Vector3d(), new Vector3d(), new Quaterniond(), new Vector3d());
            return physicsEntity.getShipTransform();
        }
        return ship.getTransform();
    }

    public static ServerLevel dimToLevel(String dimensionString) {
        MinecraftServer server = ValkyrienSkiesMod.getCurrentServer();
        if (server == null) return null;

        return server.getLevel(ResourceKey.create(Registries.DIMENSION, new ResourceLocation(dimensionString)));
    }*/

}
